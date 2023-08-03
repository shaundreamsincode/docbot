module Api
  module V1
    class ChatsController < ApiController
      PROMPT = "I want you to act as an AI assisting a doctor.  You will gather the history of present illness from the patient. This includes asking the patient more about their symptoms and medical conditions to better understand their problems. Only ask one question at a time and let the patient answer before asking another question. Ask as many clarifying questions as you can. DO NOT OFFER MEDICAL ADVICE."

      def show
        chat = Chat.find_by(token: params[:token])

        if chat.nil?
          # todo - make error messages less hacky lol
          render json: { error: 'chatNotFound' }, status: :not_found
        elsif chat.closed_at.present?
          render json: { error: 'chatClosed' }, status: :unprocessable_entity
        else
          Event.create!(name: :chat_viewed)
          chat_json = chat.to_json(include: [:messages], encryption_key: ENV["ENCRYPTION_PRIMARY_KEY"])

          # todo - possibly filter out system messages here...?
          render json: chat_json
        end
      end

      def create
        chat = CreateChat.call(language: chat_params[:language]).chat

        puts "hi #{ENV["ENCRYPTION_PRIMARY_KEY"]}"
        chat_json = chat.to_json(include: [:messages])
        render json: chat_json
      end

      def close
        chat = Chat.find_by!(token: params[:token])

        # if chat.closed_at.present?
        #   render json: { error: "Chat already closed" }, status: :unprocessable_entity
        # else
          chat.update!(closed_at: Time.zone.now)
        chat_json = chat.to_json(include: [:messages], encryption_key: ENV["ENCRYPTION_PRIMARY_KEY"])

        render json: chat_json
        # end
      end

      def clear_messages
        chat = Chat.find_by!(token: params[:token])
        chat.messages.each { |message| message.destroy! unless message.is_prompt }
        chat.reload

        render json: chat.to_json(include: [:messages])
      end

      private def chat_params
        params.require(:chat).permit(:language)
      end
    end
  end
end

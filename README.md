# DocBot - AI-Powered Primary Care Intake Assistant

DocBot is an intelligent AI agent designed to streamline the patient intake process in primary care offices. By serving as the first point of contact, DocBot helps gather essential patient information, assess initial concerns, and prepare the groundwork for efficient medical consultations.

## Features

- **Intelligent Patient Intake**: Automated collection of patient information and medical history
- **Natural Language Processing**: Conversational interface for patient interaction
- **Secure Data Handling**: HIPAA-compliant data management and privacy protection
- **Integration Ready**: Designed to work seamlessly with existing healthcare systems
- **Real-time Communication**: Instant messaging capabilities for patient-provider interaction

## Tech Stack

- **Backend**: Ruby on Rails 7.0
- **Frontend**: React.js with Material-UI
- **Database**: PostgreSQL
- **AI Integration**: OpenAI GPT (via ruby-openai gem)
- **Real-time Features**: Action Cable with Redis
- **Email Service**: Postmark
- **Authentication**: JWT-based authentication system

## Prerequisites

- Ruby 3.1.0
- Node.js
- PostgreSQL
- Redis
- Yarn

## Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd docbot
   ```

2. Install Ruby dependencies:
   ```bash
   bundle install
   ```

3. Install JavaScript dependencies:
   ```bash
   yarn install
   ```

4. Set up the database:
   ```bash
   rails db:create db:migrate
   ```

5. Configure environment variables:
   - Copy `.env.example` to `.env`
   - Fill in the required environment variables

6. Start the development server:
   ```bash
   ./bin/dev
   ```

## Development

- Run tests: `bundle exec rspec`
- Build assets: `yarn build`
- Start development server: `./bin/dev`

## Security

This application handles sensitive medical information and implements various security measures:
- JWT-based authentication
- Encrypted data storage
- HIPAA compliance considerations
- Secure API endpoints

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

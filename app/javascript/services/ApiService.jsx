import axios from "axios";

class ApiService {
    static get(url) {
        return axios.get(url, { headers: { Authorization: `Bearer ${this._fetchJwtToken()}` } })
    }

    static post(url, data={}, headers={}) {
        const requestHeaders = { ...headers, ...{ Authorization: `Bearer ${this._fetchJwtToken()}` } }
        return axios.post(url, data, { headers: requestHeaders })
    }

    static _fetchJwtToken () {
        return localStorage.getItem('token')
    }
}

export default ApiService

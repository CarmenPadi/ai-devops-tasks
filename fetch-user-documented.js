/**
 * Fetches user data from the API for a given userId.
 *
 * Makes a GET request to `https://api.example.com/users/{userId}`.
 * If the request is successful, returns an object containing the user's name, email,
 * and last login date as a JavaScript Date object.
 * If an error occurs (network error or non-OK HTTP status), logs the error and returns null.
 *
 * @param {number|string} userId - The ID of the user to fetch.
 * @returns {Promise<{name: string, email: string, lastLogin: Date} | null>} 
 *   A promise that resolves to the user data object, or null if an error occurs.
 */
function fetchUserData(userId) {
  return fetch(`https://api.example.com/users/${userId}`)
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      return {
        name: data.name,
        email: data.email,
        lastLogin: new Date(data.lastLoginTimestamp)
      };
    })
    .catch(error => {
      console.error('Fetch error:', error);
      return null;
    });
}

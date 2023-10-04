import { jwtDecode } from "jwt-js-decode";

export const tokenDecode = (token) => {
  let jwt = jwtDecode(token);
  return jwt.payload.user_id;
};

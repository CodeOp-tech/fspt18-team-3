import { useRouteLoaderData, useFetcher } from "react-router-dom";
import Button from "@mui/material/Button";
import './AuthStatus.css'

function AuthStatus() {
  let token = useRouteLoaderData("root");
  let fetcher = useFetcher();

  if (!token) {
    return <p>No estás autenticado</p>;
  }

  let isLoggingOut = fetcher.formData !== undefined;

  return (
    <div className="logoutWrapper">
      <fetcher.Form method="post" action="/logout">
        <Button type="submit" size="small" variant="outlined" disabled={isLoggingOut} >
          {isLoggingOut ? "Logging out...." : "Log out"}
        </Button>
      </fetcher.Form>
    </div>
  );
}

export default AuthStatus
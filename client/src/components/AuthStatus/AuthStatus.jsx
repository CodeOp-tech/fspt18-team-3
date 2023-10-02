import { useRouteLoaderData, useFetcher } from "react-router-dom";

function AuthStatus() {
  // Recupera el usuario, si existe, de la ruta "root" en la función "loader" desde main.jsx
  let data = useRouteLoaderData("root");
  let fetcher = useFetcher();

  if (!data.user) {
    return <p>No estás autenticado</p>;
  }

  let isLoggingOut = fetcher.formData !== null;

  return (
    <div>
      <p>Bienvenido {data.user.username}!</p>
      <fetcher.Form method="post" action="/logout">
        <button type="submit" disabled={isLoggingOut}>
          {isLoggingOut ? "Logging out...." : "Log out"}
        </button>
      </fetcher.Form>
    </div>
  );
}

export default AuthStatus
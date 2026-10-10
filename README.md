# Weather App (Starter)

This is a small static starter for a weather app using the OpenWeatherMap API.

- Open `src/index.html` in your browser, or serve the folder with a static server.
- Replace `YOUR_API_KEY` in `src/app.js` with your OpenWeatherMap API key (https://openweathermap.org/api).

Quick run options (PowerShell):

```powershell
# 1) Open directly (double-click index.html) or
# 2) Serve with Python (if installed):
python -m http.server 5500; Start-Process "http://localhost:5500/src/index.html"

# 3) Or serve with Node (if you have `npx`):
npx serve .
```

Next steps:
- Add API key storage (.env) or a backend proxy to keep the key secret.
- Improve UI and error handling.


## Deploying to Vercel (PHP + MySQL)

This branch configures the project to use the community `vercel-php` runtime. The PHP pages remain in `src/`, and the existing PHP API endpoints remain in `api/`.

### Before deploying

1. Create a **managed MySQL database** that accepts connections from Vercel. A local XAMPP database at `localhost` is not reachable by a hosted Vercel function.
2. Import/create the app's `journals`, `points`, and `searches` tables in that database. Export the schema/data from your current local database first if you already have it.
3. In Vercel, open **Project → Settings → Environment Variables** and add:
   - `DB_HOST`: managed database hostname
   - `DB_PORT`: database port (usually `3306`)
   - `DB_USER`: database username
   - `DB_PASSWORD`: database password
   - `DB_NAME`: database name
4. Deploy the `deploy/vercel-php-runtime` branch as a **Preview** first. Test the home page, dashboard, weather search, and database-backed journal/points/search features before merging to `main`.

The `config.php` keeps local XAMPP defaults for development, but uses the environment variables above when present. Never commit real production database credentials.

### Notes

- Pinned cities are stored in browser `localStorage` because the repository references pinned-city PHP endpoints that are not present in the current repository.
- The browser-side OpenWeather and Giphy keys are visible to visitors. Review the providers' restrictions and rotate/restrict the keys if needed.
- The database schema is not included in the current repository. Export it from your existing `weather_app` database before provisioning production MySQL.
- Vercel's PHP runtime is a community runtime, not one of Vercel's official runtimes. Check the [runtime documentation](https://vercel.com/docs/functions/runtimes) and [PHP runtime project](https://github.com/vercel-community/php) if its configuration changes.

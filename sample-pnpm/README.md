# Project Structure

```
sample-project
├── README.md
├── apps
│   ├── sample-admin
│   └── sample-app
├── database
│   └── postgre.dockerfile
├── docker-compose.yaml
├── libs
│   └── react-email-starter
├── package.json
├── pnpm-lock.yaml
└── pnpm-workspace.yaml
```

## Create nextjs app in apps directory

```terminal
% pnpm dlx create-next-app@latest
Progress: resolved 1, reused 0, downloaded 1, added 1, done
✔ What is your project named? … sample-app
✔ Would you like to use TypeScript? … No / Yes
✔ Would you like to use ESLint? … No / Yes
✔ Would you like to use Tailwind CSS? … No / Yes
✔ Would you like to use `src/` directory? … No / Yes
✔ Would you like to use App Router? (recommended) … No / Yes
✔ Would you like to customize the default import alias (@/*)? … No / Yes
✔ What import alias would you like configured? … @/*
Creating a new Next.js app in /sample-project/sample-1/apps/sample-app.
```

### run application directory

```terminal
% pwd
/sample-project/apps/sample-app
% pnpm run dev
> next dev

  ▲ Next.js 13.5.4
  - Local:        http://localhost:3000

 ✓ Ready in 5.7s
 ○ Compiling /page ...
 ✓ Compiled /page in 4.7s (493 modules)
 ✓ Compiled in 339ms (234 modules)
 ✓ Compiled /favicon.ico/route in 1056ms (500 modules)
```

### run project root directory

```
% pwd
/sample-project
% vi package.json
```

```sample-project/package.json
"scripts": {
    "serve:dev": "pnpm run --filter=\"./apps/**/**\" dev"
  },
```

```terminal
% pnpm serve:dev
```

## Creat Admin Directory

```terminal
% pnpm dlx create-next-app@latest
Progress: resolved 1, reused 0, downloaded 1, added 1, done
✔ What is your project named? … sample-admin
✔ Would you like to use TypeScript? … No / Yes
✔ Would you like to use ESLint? … No / Yes
✔ Would you like to use Tailwind CSS? … No / Yes
✔ Would you like to use `src/` directory? … No / Yes
✔ Would you like to use App Router? (recommended) … No / Yes
✔ Would you like to customize the default import alias (@/*)? … No / Yes
✔ What import alias would you like configured? … @/*
Creating a new Next.js app in /sample-project/sample-1/apps/sample-admin.
```

```termianl
$ pwd
/sample-project
$ pnm run serve:dev
```

## Create Email Content

```terminal
$ pwd
/sample-project/libs
$ pnpm create email
$ cd ../
$ pwd
/sample-project
$ pnpm install
$ pnpm run serve:dev
```

## Create database and shared data

### create postgre container

```terminal
% touch docker-compose.yaml
% mkdir database
% touch database/postgres.dockerfile
```

```docker-compsoe.yaml
version: "3"
services:
  database:
    container_name: db_container
    networks:
      - local
    restart: always
    build:
      context: ./database
      dockerfile: postgre.dockerfile
    ports:
      - 5432:5432
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_DB: sample

volumes:
  db_data: {}

networks:
  local: {}

```

```database/postgres.dockerfile
FROM postgres:15
```

### create prisma shared data

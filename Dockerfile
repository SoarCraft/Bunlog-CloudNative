FROM node:current-alpine as base

RUN apk add --no-cache libc6-compat

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
ENV POSTGRES_PRISMA_URL=${POSTGRES_PRISMA_URL}

RUN corepack enable

COPY . .

RUN pnpm install --frozen-lockfile
RUN pnpm run build

EXPOSE 3000
CMD ["pnpm", "start"]

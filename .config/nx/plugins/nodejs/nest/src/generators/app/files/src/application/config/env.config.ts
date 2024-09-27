import { env, TYPES } from '../../common/utils/env';

export const config = () => ({
  server: {
    host: env('HTTP_HOST', TYPES.String) || '0.0.0.0',
    port: env('HTTP_PORT', TYPES.Int) || 3000,
  },
  typeorm: {
    type: 'postgres',
    host: env('DATABASE_HOST', TYPES.String),
    port: env('DATABASE_PORT', TYPES.Int),
    username: env('DATABASE_USER', TYPES.String),
    password: env('DATABASE_PASSWORD', TYPES.String),
    database: env('DATABASE_NAME', TYPES.String),
  },
}) as const;

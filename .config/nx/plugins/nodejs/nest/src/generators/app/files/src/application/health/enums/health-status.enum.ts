export const HealthStatus = {
  OK: 'ok',
  ERROR: 'error',
} as const;

export type HealthStatus = typeof HealthStatus[keyof typeof HealthStatus];

import { resolve } from 'path';

export const WORKSPACE_ROOT = '/workspaces/repo';
export const CONFIG_ROOT = '.config';

export const PACKAGE_BACKEND_ROOT = 'apps/backend';
export const PACKAGE_FRONTEND_ROOT = 'apps/frontend';
export const PACKAGE_LAMBDA_ROOT = 'libs/lambda';
export const PACKAGE_JOB_ROOT = 'libs/job';
export const PACKAGE_WORKER_ROOT = 'libs/worker';

export const PKG_PATH = `${WORKSPACE_ROOT}/package.json`;
export const STATE_PATH = `${WORKSPACE_ROOT}/${CONFIG_ROOT}/nx/state.json`;

export const NODEJS_CONFIG_PATH = `${WORKSPACE_ROOT}/${CONFIG_ROOT}/lang/nodejs`;
export const TS_CONFIG_PATH = `${WORKSPACE_ROOT}/${CONFIG_ROOT}/lang/ts`;

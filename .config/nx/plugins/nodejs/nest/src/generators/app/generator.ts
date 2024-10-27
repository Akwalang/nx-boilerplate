import * as path from 'path';

import { addProjectConfiguration, formatFiles, generateFiles, Tree } from '@nx/devkit';

import { AppGeneratorSchema } from './schema';

import {
  exec,
  State,
  WORKSPACE_ROOT,
  TS_CONFIG_PATH,
  PACKAGE_BACKEND_ROOT,
} from '../../../../../../tools';

export async function appGenerator(tree: Tree, options: AppGeneratorSchema) {
  const projectRoot = `${PACKAGE_BACKEND_ROOT}/${options.name}`;

  const state = await State.create();

  const extOpetions = {
    ...options,
    projectRoot,
    langConfigRoot: TS_CONFIG_PATH,
    scope: state.getScope(),
    port: state.getPort(),
    author: state.pkg.author ?? '',
    license: state.pkg.license ?? '',
  };

  await state.save();

  console.log('Params:', extOpetions);

  addProjectConfiguration(tree, extOpetions.name, {
    root: projectRoot,
    projectType: 'application',
    sourceRoot: `${projectRoot}/src`,
    targets: {},
  });

  generateFiles(tree, path.join(__dirname, 'files'), projectRoot, extOpetions);

  await formatFiles(tree);
}

export default appGenerator;

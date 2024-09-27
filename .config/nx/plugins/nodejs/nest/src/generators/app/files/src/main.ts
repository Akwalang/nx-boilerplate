import { startApplication } from './application';
import { startSwagger } from './swagger';

const main = async (): Promise<void> => {
  await startApplication([startSwagger]);
}

main();

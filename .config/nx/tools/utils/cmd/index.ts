import { spawn } from 'node:child_process';

export const exec = async (command: string, args: string[] = []): Promise<void> => {
  return new Promise<void>((resolve, reject) => {
    const child = spawn(command, args, { stdio: 'inherit' });

    // ls.stdout.on('data', (data) => {
    //   console.log(`stdout: ${data}`);
    // });

    child.on('exit', (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`Command failed with exit code ${code}`));
      }
    });
  });
};

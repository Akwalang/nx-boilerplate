import { readFile, writeFile } from "fs/promises";

export const readJson = async (path: string) => {
  const data = await readFile(path, 'utf-8');

  return JSON.parse(data);
};

export const writeJson = async (path: string, data: Record<any, any>) => {
  await writeFile(path, JSON.stringify(data, null, 2));
};

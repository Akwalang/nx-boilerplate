import { Package, State as StateInt } from './interfaces';

import { readJson, writeJson } from '../../utils/file';
import { PKG_PATH, STATE_PATH } from '../../../tools/constants';

export class State {
  private constructor(
    public pkg: Package,
    public state: StateInt,
  ) {}

  static create = async () => {
    try {
      const state = await readJson(STATE_PATH);
      const pkg = await readJson(PKG_PATH);

      return new State(pkg, state);
    } catch (error) {
      console.error('Error reading state: ' + error.message);
      throw new Error('Error reading state');
    }
  };

  async save(): Promise<void> {
    try {
      await writeJson(STATE_PATH, this.state);
    } catch (error) {
      console.error('Error writing state: ' + error.message);
      throw new Error('Error writing state');
    }
  };

  getScope(): string {
    return this.pkg.name;
  }

  getPort(): number {
    return this.state.nextPort++;
  }
}

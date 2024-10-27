import { Injectable } from '@nestjs/common';
import { ConfigService as NestConfigService } from '@nestjs/config';

import { config } from './env.config';

type Config = ReturnType<typeof config>;

@Injectable()
export class ConfigService {
  constructor(
    private nestConfigService: NestConfigService,
  ) {}

  getServerSettings(): Config['server'] {
    return this.nestConfigService.getOrThrow('server');
  }

  getTypeOrmSettings(): Config['typeorm'] {
    return this.nestConfigService.getOrThrow('typeorm');
  }
}

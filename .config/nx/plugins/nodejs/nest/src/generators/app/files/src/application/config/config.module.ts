import { Module } from '@nestjs/common';

import {
  ConfigModule as NestConfigModule,
  ConfigService as NestConfigService,
} from '@nestjs/config';

import { ConfigService } from './config.service';

import { config } from './env.config';
import { validate } from './env.validation';

@Module({
  imports: [
    NestConfigModule.forRoot({
      isGlobal: true,
      validate,
      load: [config],
    }),
  ],
  providers: [NestConfigService, ConfigService],
  exports: [ConfigService],
})
export class ConfigModule {}

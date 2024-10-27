import * as cookieParser from 'cookie-parser';

import { NestFactory } from '@nestjs/core';
import { Logger, ValidationPipe } from '@nestjs/common';
import { NestExpressApplication } from '@nestjs/platform-express';

import { AppModule } from './app.module';
import { ConfigService } from './config';

const createApplication = async (): Promise<NestExpressApplication> => {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  app.use(cookieParser());
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));

  app.enableCors({
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
    origin: [/http:\/\/localhost(:\d+)?/i],
  });

  return app;
};

export const startApplication = async (
  plugins: ((app: NestExpressApplication) => void)[] = [],
): Promise<NestExpressApplication> => {
  const logger = new Logger('Application');

  const app = await createApplication();

  plugins.forEach((plugin) => plugin(app));

  const configService = app.get<ConfigService>(ConfigService);

  const { host, port } = configService.getServerSettings();

  await app.listen(port, host);

  logger.log(`Server is running on http://${host}:${port}`);

  return app;
}

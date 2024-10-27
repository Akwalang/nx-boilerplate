import { Module, MiddlewareConsumer } from '@nestjs/common';

// import { DbModule } from './db';
import { ConfigModule } from './config';
import { HealthModule } from './health';

import { TraceMiddleware } from '../common/middlewares/trace';
import { LoggerMiddleware } from '../common/middlewares/logger';

@Module({
  imports: [
    // DbModule,
    ConfigModule,
    HealthModule,
  ],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(TraceMiddleware).forRoutes('*');
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}

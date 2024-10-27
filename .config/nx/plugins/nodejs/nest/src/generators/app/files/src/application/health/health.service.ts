import { Injectable } from '@nestjs/common';

import { HealthCheckResponseDto } from './dto';
import { HealthStatus } from './enums';

@Injectable()
export class HealthService {
  check(): HealthCheckResponseDto {
    return { status: HealthStatus.OK };
  }
}

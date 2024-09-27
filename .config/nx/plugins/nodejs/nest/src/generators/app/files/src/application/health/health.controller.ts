import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { Controller, Get } from '@nestjs/common';

import { HealthService } from './health.service';

import { HealthCheckResponseDto } from './dto';

@ApiTags('Health')
@Controller('health')
export class HealthController {
  constructor(private healthService: HealthService) {}

  @Get()
  @ApiOperation({ summary: 'Health check' })
  @ApiResponse({ status: 200, type: HealthCheckResponseDto })
  check(): HealthCheckResponseDto {
    return this.healthService.check();
  }
}

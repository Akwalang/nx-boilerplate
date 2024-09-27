import { Type } from 'class-transformer';
import { IsEnum, IsNumber, IsString, Max, Min } from 'class-validator';

import { Environment } from '../enums';

export class EnvironmentVariables {
  @IsEnum(Environment)
  NODE_ENV: Environment;

  @IsString()
  HTTP_HOST: string;

  @IsNumber()
  @Min(0)
  @Max(65535)
  HTTP_PORT: number;

  @IsString()
  DATABASE_HOST: string;

  @Type(() => Number)
  @IsNumber()
  @Min(0)
  @Max(65535)
  DATABASE_PORT: string;

  @IsString()
  DATABASE_USER: string;

  @IsString()
  DATABASE_PASSWORD: string;

  @IsString()
  DATABASE_NAME: string;
}

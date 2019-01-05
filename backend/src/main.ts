import { NestFactory } from '@nestjs/core';

import { join } from 'path';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useStaticAssets(join(__dirname, 'static'));
  app.setViewEngine('html');
  await app.listen(8080);
}
bootstrap();

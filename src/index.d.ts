// src/index.d.ts

declare module 'media-files-reindex-mobile' {
  export function scanFile(path: string): Promise<void>;
  export function downloadFile(url: string, outputPath: string): Promise<string>;
}

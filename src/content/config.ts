import { defineCollection, z } from 'astro:content';

const works = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    category: z.enum(['graphic-design', 'ai-video']),
    cover: z.string(),
    date: z.string(),
    tags: z.array(z.string()).optional(),
    video: z.string().optional(),
    featured: z.boolean().optional().default(false),
  }),
});

export const collections = { works };

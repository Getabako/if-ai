import fs from 'fs';
import path from 'path';
import { remark } from 'remark';
import html from 'remark-html';

export async function getStaticProps() {
  const filePath = path.join(process.cwd(), 'ホームページの仕様書.md');
  const fileContents = fs.readFileSync(filePath, 'utf8');
  const processedContent = await remark().use(html).process(fileContents);
  const contentHtml = processedContent.toString();
  return { props: { contentHtml } };
}

export default function Home({ contentHtml }) {
  return (
    <div className="container">
      <div dangerouslySetInnerHTML={{ __html: contentHtml }} />
    </div>
  );
}

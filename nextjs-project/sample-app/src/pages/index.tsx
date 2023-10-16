import { GetStaticProps, InferGetStaticPropsType, NextPage } from "next";
import { prisma } from "../../lib/prisma"

type PageProps = InferGetStaticPropsType<typeof getStaticProps>;

export const HomePage: NextPage<PageProps> = ({ feeds }) => {
  console.log(feeds)
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between font-mono text-sm lg:flex">
        <p className="fixed left-0 top-0 flex w-full justify-center border-b border-gray-300 bg-gradient-to-b from-zinc-200 pb-6 pt-8 backdrop-blur-2xl dark:border-neutral-800 dark:bg-zinc-800/30 dark:from-inherit lg:static lg:w-auto  lg:rounded-xl lg:border lg:bg-gray-200 lg:p-4 lg:dark:bg-zinc-800/30">
          Get started by editing&nbsp;
          <code className="font-mono font-bold">src/app/page.tsx</code>
        </p>
      </div>
    </main>
  )
}

export const getStaticProps: GetStaticProps = async () => {
  const feeds = await prisma.post.findMany({
    include: {
      author: {
        select: { name: true },
      },
    },
  });
  return {
    props: { feeds },
    revalidate: 10,
  };
};

export default HomePage
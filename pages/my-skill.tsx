import Layout from "components/common/layouts";
import DualColumnLayout from "components/common/dual-column-layout";

const MySkillPage = () => {
  return <DualColumnLayout />;
};

export default MySkillPage;

MySkillPage.getLayout = function getLayout(page: React.ReactNode) {
  return <Layout>{page}</Layout>;
};

import Layout from "components/common/layouts";
import DualColumnLayout from "components/common/dual-column-layout";

const MyWorkPage = () => {
  return <DualColumnLayout />;
};

export default MyWorkPage;

MyWorkPage.getLayout = function getLayout(page: React.ReactNode) {
  return <Layout>{page}</Layout>;
};

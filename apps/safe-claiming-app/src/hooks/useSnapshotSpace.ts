import { useSafeAppsSDK } from "@gnosis.pm/safe-apps-react-sdk"
import { CHAIN_CONSTANTS } from "src/config/constants"

export const useSafeSnapshotSpace = () => {
  const { safe } = useSafeAppsSDK()
  return CHAIN_CONSTANTS[safe.chainId]?.DELEGATE_ID
}

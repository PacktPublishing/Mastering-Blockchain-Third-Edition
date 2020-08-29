import React from 'react';
import { DrizzleProvider } from 'drizzle-react'
import { LoadingContainer, AccountData, ContractData, ContractForm} from 'drizzle-react-components'
import PatentIdea from './artifacts/PatentIdea.json'

const options = { contracts: [PatentIdea] }

function App() {
  
  return (
    <DrizzleProvider options={options}>
      <LoadingContainer>
    
      <div> 
        <h2> Patent Dapp</h2>

        <h5>My Account details</h5>
        <AccountData accountIndex={0} units={"ether"} precision={2} />

        <h5> upload patent idea</h5>
        <ContractForm contract="PatentIdea" method="SaveIdeaHash"/>
    
        <h5> how many ideas so far</h5>
        <ContractData contract="PatentIdea" method="getTracker"></ContractData>

      </div>
      </LoadingContainer>

    </DrizzleProvider>
  );
}
export default App;
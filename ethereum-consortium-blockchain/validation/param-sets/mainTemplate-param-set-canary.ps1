# Params for mainTemplate.json
echo "Loading param sets for canary validation of Azure Marketplace template"

# Plese define the following variables in your personal automated-validation script
#$location       = <SET TO DESIRED AZURE REGION>;
#$baseUrl        = <SET TO BASE FOLDER LOCATION OF TEMPLTE FILE>;
#$authType       = <SET TO EITHER password or sshPublicKey>;
#$vmAdminPasswd  = <SET TO DESIRED PASSWORD>;
#$ethPasswd      = <SET TO DESIRED PASSWORD>;
#$passphrase     = <SET TO DESIRED PASSPHRASE>;
#$sshPublicKey   = <SET TO YOUR SSH PUBLIC KEY>;

# Some overridable defaults
if ([string]::IsNullOrEmpty($location))
{ $location = "centralus"; }

if (!$networkID)
{ $networkID = 10101; }

if ([string]::IsNullOrEmpty($authType))
{ $authType = "password"; }

$paramSet = @{
  "Tiny-Standard_LRS-D1" = @{
    "namePrefix"                = "ethnet";
    "authType"                  = $authType;
    "adminUsername"             = "gethadmin";
    "adminPassword"             = $vmAdminPasswd;
    "adminSSHKey"               = $sshPublicKey;
    "ethereumAccountPsswd"      = $ethPasswd;
    "ethereumAccountPassphrase" = $passphrase;
    "ethereumNetworkID"         = $networkID;
    "numConsortiumMembers"      = 2;
    "numMiningNodesPerMember"   = 1;
    "mnNodeVMSize"              = "Standard_D1";
    "mnStorageAccountType"      = "Standard_LRS"
    "numTXNodes"                = 1;
    "txNodeVMSize"              = "Standard_D1";
    "txStorageAccountType"      = "Standard_LRS";
    "location"                  = $location;
    "baseUrl"                   = $baseUrl;
  };
  "Small-Standard_LRS-A1" = @{
    "namePrefix"                = "ethnet";
    "authType"                  = $authType;
    "adminUsername"             = "gethadmin";
    "adminPassword"             = $vmAdminPasswd;
    "adminSSHKey"               = $sshPublicKey;
    "ethereumAccountPsswd"      = $ethPasswd;
    "ethereumAccountPassphrase" = $passphrase;
    "ethereumNetworkID"         = $networkID;
    "numConsortiumMembers"      = 3;
    "numMiningNodesPerMember"   = 2;
    "mnNodeVMSize"              = "Standard_A1";
    "mnStorageAccountType"      = "Standard_LRS"
    "numTXNodes"                = 2;
    "txNodeVMSize"              = "Standard_A1";
    "txStorageAccountType"      = "Standard_LRS";
    "location"                  = $location;
    "baseUrl"                   = $baseUrl;
  }
};
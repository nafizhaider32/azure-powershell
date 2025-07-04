if(($null -eq $TestName) -or ($TestName -contains 'New-AzNetworkFabricInternalNetwork'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-AzNetworkFabricInternalNetwork.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-AzNetworkFabricInternalNetwork' {
    It 'Create' {
        {
            $bgpAllowAs = 2
            $bgpAllowAsOverride = "Enable"
            $BfdConfigurationInterval = 300
            $bfdConfigurationMultiplier = 3
            $bgpDefaultRouteOriginate = "True"
            $bgpIpv4ListenRangePrefix = @("20.10.10.2/28")
            $bgpIpv4NeighborAddress = @(@{
                Address = "20.10.10.2"
            })
            $bgpPeerAsn = 65047

            $connectedIPv4Subnet = @(@{
                Prefix = "20.10.10.2/28"
            })
            $exportRoutePolicy = @{
                ExportIpv4RoutePolicyId = $global:config.internalnetwork.exportIpv4RoutePolicyId
                ExportIpv6RoutePolicyId = $global:config.internalnetwork.exportIpv6RoutePolicyId
            }
            $importRoutePolicy = @{
                ImportIpv4RoutePolicyId = $global:config.internalnetwork.importIpv4RoutePolicyId
                ImportIpv6RoutePolicyId = $global:config.internalnetwork.importIpv6RoutePolicyId
            }
            $staticRouteConfigurationBfdConfiguration = @{
                IntervalInMilliSecond = 300
                Multiplier = 3
            }
            $staticRouteConfigurationIpv4Route = @(@{
                NextHop = @("10.0.0.1")
                Prefix = "10.1.0.0/24"
            })

            New-AzNetworkFabricInternalNetwork -SubscriptionId $global:config.common.subscriptionId `
                -Name $global:config.internalnetwork.name `
                -L3IsolationDomainName $global:config.internalnetwork.l3domainName `
                -ResourceGroupName $global:config.common.resourceGroupName `
                -VlanId $global:config.internalnetwork.vlanId `
                -BgpConfigurationAllowAs $bgpAllowAs `
                -BgpConfigurationAllowAsOverride $bgpAllowAsOverride `
                -BfdConfigurationInterval $BfdConfigurationInterval `
                -BfdConfigurationMultiplier $bfdConfigurationMultiplier `
                -BgpConfigurationDefaultRouteOriginate $bgpDefaultRouteOriginate `
                -BgpConfigurationIpv4ListenRangePrefix $bgpIpv4ListenRangePrefix `
                -BgpConfigurationIpv4NeighborAddress $bgpIpv4NeighborAddress `
                -BgpConfigurationPeerAsn $bgpPeerAsn `
                -ConnectedIPv4Subnet $connectedIPv4Subnet `
                -EgressAclId $global:config.internalnetwork.egressAclId `
                -ExportRoutePolicy $exportRoutePolicy `
                -Extension $global:config.internalnetwork.extension `
                -ImportRoutePolicy $importRoutePolicy `
                -IngressAclId $global:config.internalnetwork.ingressAclId `
                -IsMonitoringEnabled $global:config.internalnetwork.isMonitoringEnabled `
                -Mtu $global:config.internalnetwork.mtu `
                -StaticRouteConfiguration $staticRouteConfigurationBfdConfiguration

        } | Should -Not -Throw
    }

    It 'CreateViaJsonString' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'CreateViaJsonFilePath' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'CreateViaIdentityL3IsolationDomainExpanded' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'CreateViaIdentityL3IsolationDomain' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

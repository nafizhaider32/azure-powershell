---
external help file:
Module Name: Az.ManagedNetworkFabric
online version: https://learn.microsoft.com/powershell/module/az.managednetworkfabric/get-aznetworkfabrictap
schema: 2.0.0
---

# Get-AzNetworkFabricTap

## SYNOPSIS
Retrieves details of this Network Tap.

## SYNTAX

### List (Default)
```
Get-AzNetworkFabricTap [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzNetworkFabricTap -Name <String> -ResourceGroupName <String> [-SubscriptionId <String[]>]
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzNetworkFabricTap -InputObject <IManagedNetworkFabricIdentity> [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

### List1
```
Get-AzNetworkFabricTap -ResourceGroupName <String> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieves details of this Network Tap.

## EXAMPLES

### Example 1: List Network Tap by Subscription
```powershell
Get-AzNetworkFabricTap -SubscriptionId $subscriptionId
```

```output
AdministrativeState Annotation ConfigurationState Destination
------------------- ---------- ------------------ -----------
Disabled                       Succeeded          
```

This command lists all the Network Tap under the given Subscription.

### Example 2: List Network Tap by Resource Group
```powershell
Get-AzNetworkFabricTap -ResourceGroupName $resourceGroupName
```

```output
AdministrativeState Annotation ConfigurationState Destination
------------------- ---------- ------------------ -----------
Disabled                       Succeeded          
```

This command lists all the Network Tap under the given Resource Group.

### Example 3: Get Network Tap
```powershell
Get-AzNetworkFabricTap -Name $name -ResourceGroupName $resourceGroupName
```

```output
AdministrativeState Annotation ConfigurationState Destination
------------------- ---------- ------------------ -----------
Disabled                       Succeeded          
```

This command gets details of the given Network Tap.

## PARAMETERS

### -DefaultProfile
The DefaultProfile parameter is not functional.
Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ManagedNetworkFabric.Models.IManagedNetworkFabricIdentity
Parameter Sets: GetViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Name of the Network Tap.

```yaml
Type: System.String
Parameter Sets: Get
Aliases: NetworkTapName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group.
The name is case insensitive.

```yaml
Type: System.String
Parameter Sets: Get, List1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The ID of the target subscription.
The value must be an UUID.

```yaml
Type: System.String[]
Parameter Sets: Get, List, List1
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ManagedNetworkFabric.Models.IManagedNetworkFabricIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ManagedNetworkFabric.Models.INetworkTap

## NOTES

## RELATED LINKS


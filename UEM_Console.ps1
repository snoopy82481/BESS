. "$PSScriptRoot\New-WPFMessageBox.ps1"
Import-Module UEM_Core -force

#Your XAML goes here :)
$inputXML = @"
<Window x:Class="UEM_Console1.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:UEM_Console1"
        mc:Ignorable="d"
        Title="UEM Console" Height="450" Width="345" ResizeMode="NoResize" >
    <Window.Resources>
        <Style TargetType="Window">
            <Setter Property="FontFamily" Value="Tahoma" />
            <Setter Property="FontSize" Value="10" />
            <Setter Property="Foreground" Value="Black" />
            <Setter Property="VerticalAlignment" Value="Top" />
            <Setter Property="HorizontalAlignment" Value="Center" />
        </Style>
        <!-- Label Styles-->
        <Style x:Key="LabelBase" TargetType="Label">
            <Setter Property="Foreground" Value="Black" />
            <Setter Property="FontSize" Value="10" />
            <Setter Property="FontWeight" Value="Bold" />
            <Setter Property="VerticalAlignment" Value="Top" />
            <Setter Property="HorizontalAlignment" Value="Left" />
        </Style>
        <Style x:Key="Searcher" TargetType="Label" BasedOn="{StaticResource LabelBase}">
            <Setter Property="Foreground" Value="White" />
        </Style>
        <Style TargetType="Label" BasedOn="{StaticResource LabelBase}" />
        <!-- End Label Styles-->
        <!-- Textbox Styles-->
        <Style x:Key="TextBoxDefault" TargetType="TextBox">
            <Setter Property="Foreground" Value="Black" />
            <Setter Property="Height" Value="20" />
            <Setter Property="Width" Value="240" />
            <Setter Property="VerticalScrollBarVisibility" Value="Disabled" />
            <Setter Property="HorizontalAlignment" Value="Left" />
            <Setter Property="VerticalAlignment" Value="Top" />
            <Setter Property="TextWrapping" Value="NoWrap" />
            <Setter Property="Grid.Column" Value="1" />
            <Setter Property="BorderThickness" Value="0,0,1,1" />
            <Setter Property="BorderBrush" Value="Black" />
            <Setter Property="IsReadOnly" Value="True" />
        </Style>
        <Style TargetType="TextBox" BasedOn="{StaticResource TextBoxDefault}" />
        <!-- End Textbox Styles-->
        <!-- Textblock Styles-->
        <Style x:Key="TextBlockBase" TargetType="TextBlock">
            <Setter Property="Foreground" Value="Black" />
            <Setter Property="Background" Value="White" />
            <Setter Property="Height" Value="40" />
            <Setter Property="Width" Value="240" />
            <Setter Property="HorizontalAlignment" Value="Left" />
            <Setter Property="VerticalAlignment" Value="Top" />
            <Setter Property="TextWrapping" Value="NoWrap" />
        </Style>
        <Style x:Key="notCalledBorder" TargetType="Border">
            <Setter Property="BorderThickness" Value="1" />
            <Setter Property="BorderThickness" Value="0,0,1,1" />
            <Setter Property="BorderBrush" Value="Black" />
        </Style>
        <Style TargetType="TextBlock" BasedOn="{StaticResource TextBlockBase}" />
        <!-- End Textblock Styles -->
        <!-- Start Button Styles -->
        <Style x:Key="ButtonBase" TargetType="Button">
            <Setter Property="HorizontalAlignment" Value="Left" />
            <Setter Property="VerticalAlignment" Value="Center" />
            <Setter Property="Height" Value="20" />
            <Setter Property="Width" Value="110" />
            <Setter Property="BorderThickness" Value="0,0,1,1" />
            <Setter Property="BorderBrush" Value="Black" />
            <Setter Property="Margin" Value="1" />
            <Setter Property="FontSize" Value="9" />
            <Setter Property="Background" Value="LightGray" />
            <Setter Property="IsEnabled" Value="False" />
            <Style.Triggers>
                <!--<EventTrigger RoutedEvent="Button.Click">
                    <EventTrigger.Actions>
                        <BeginStoryboard>
                            <Storyboard TargetProperty="RenderTransform.Angle">
                                <ColorAnimation Storyboard.TargetProperty="(Button.Background).(SolidColorBrush.Color)" From="LightGray" To="DarkGray" Duration="0:0:0.1" AutoReverse="True"/>
                                <DoubleAnimation From="0" To="180"  Duration="0:0:1.05" AutoReverse="True" FillBehavior="Stop"/>
                            </Storyboard>
                        </BeginStoryboard>
                </EventTrigger.Actions>
                </EventTrigger> -->
                <Trigger Property="IsMouseOver" Value="True">
                    <Trigger.EnterActions>
                        <BeginStoryboard>
                            <Storyboard>
                                <DoubleAnimation Storyboard.TargetProperty="(Button.Opacity)" From="1.0" To="0.5" Duration="0:0:0" />
                            </Storyboard>
                        </BeginStoryboard>
                    </Trigger.EnterActions>
                    <Trigger.ExitActions>
                        <BeginStoryboard>
                            <Storyboard>
                                <DoubleAnimation Storyboard.TargetProperty="(Button.Opacity)" To="1" Duration="0:0:0" />
                            </Storyboard>
                        </BeginStoryboard>
                    </Trigger.ExitActions>
                </Trigger>
            </Style.Triggers>
        </Style>
        <Style x:Key="Menu_btn" TargetType="Button" BasedOn="{StaticResource ButtonBase}">
            <Setter Property="Width" Value="55" />
        </Style>
        <Style TargetType="Button" BasedOn="{StaticResource ButtonBase}" />
        <!-- End Button Styles -->
        <Style TargetType="DataGrid">
            <Setter Property="Width" Value="240" />
            <Setter Property="HeadersVisibility" Value="None" />
            <Setter Property="Grid.Column" Value="1" />
            <Setter Property="VerticalAlignment" Value="Top" />
            <Setter Property="BorderThickness" Value="0,0,1,1" />
            <Setter Property="BorderBrush" Value="Black" />
            <Setter Property="Background" Value="White" />
            <Setter Property="AutoGenerateColumns" Value="False" />
            <Setter Property="GridLinesVisibility" Value="Horizontal" />
        </Style>
    </Window.Resources>
    <Grid Background="#FFE5E5E5" Width="345" HorizontalAlignment="Left">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto" />
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="22" />
            <RowDefinition Height="Auto" />
        </Grid.RowDefinitions>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
            <Button x:Name="GetUser_btn" Content="Get User" IsEnabled="True" Style="{StaticResource Menu_btn}" />
            <Button x:Name="clear_btn" Content="Clear" Style="{StaticResource Menu_btn}" />
            <Button x:Name="SetActivation_btn" Content="Set Activation Password" FontSize="8" Width="90" />
            <Button x:Name="RemoveActivation_btn" Content="Remove Activation Passwords" FontSize="8" />
        </StackPanel>
        <Grid Margin="0,2" Grid.Row="1">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="90" />
                <ColumnDefinition Width="240" />
            </Grid.ColumnDefinitions>
            <Grid.RowDefinitions>
                <RowDefinition Height="22" />
                <RowDefinition Height="22" />
                <RowDefinition Height="22" />
                <RowDefinition Height="22" />
                <RowDefinition Height="22" />
                <RowDefinition Height="22" />
                <RowDefinition Height="44" />
                <RowDefinition Height="200" />
            </Grid.RowDefinitions>
            <Label Content="E-Mail Address:" />
            <Label Content="Display Name:" Grid.Row="1" />
            <Label Content="Name:" Grid.Row="2" />
            <Label Content="GUID:" Grid.Row="3" />
            <Label Content="Created:" Grid.Row="4" />
            <Label Content="Directory ID:" Grid.Row="5" />
            <Grid Grid.Row="6">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="45" />
                        <ColumnDefinition Width="45" />
                    </Grid.ColumnDefinitions>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="22" />
                        <RowDefinition Height="22" />
                    </Grid.RowDefinitions>
                    <Label Content="Groups:" Grid.ColumnSpan="2"/>
                    <Button x:Name="addGroup_btn" Content="Add" Width="40" Grid.Row="1" HorizontalAlignment="Right" />
                    <Button x:Name="removeGroup_btn" Content="Remove" Width="40" Grid.Row="1" Grid.Column="1" />
                </Grid>
            </Grid>
            <StackPanel Grid.Row="7">
                <Label Content="Device(s):" VerticalAlignment="Top" />
                <Button x:Name="RemoveDevice_btn" Content="Remove Device" FontSize="8" Width="80" HorizontalAlignment="Center" />
            </StackPanel>
            <TextBox x:Name="uemEmailAddress_TB" IsReadOnly="False" />
            <TextBox x:Name="uemDisplayName_TB" Grid.Row="1" />
            <TextBox x:Name="uemName_TB" Grid.Row="2" />
            <TextBox x:Name="uemGuid_TB" Grid.Row="3" />
            <TextBox x:Name="uemCreated_TB" Grid.Row="4" />
            <TextBox x:Name="uemDirectoryId_TB" Grid.Row="5" />
            <DataGrid x:Name="uemGroup_DG" Grid.Row="6" VerticalAlignment="Top" Height="40">
                <DataGrid.Columns>
                    <DataGridTextColumn Header="Guid" Width="Auto" Binding="{Binding Guid}" />
                    <DataGridTextColumn Header="Name" Width="Auto" Binding="{Binding Name}" />
                </DataGrid.Columns>                
            </DataGrid>
            <TextBox x:Name="uemDevice_TB" Grid.Row="7" Height="200" TextWrapping="Wrap" VerticalScrollBarVisibility="Visible"/>
            <DataGrid x:Name="uemDevice_DG" Grid.Row="7" Height="200" HeadersVisibility="Column">
                <DataGrid.Columns>
                    <DataGridTextColumn Header="EnrollmentType" Width="Auto" Binding="{Binding EnrollmentType}" />
                    <DataGridTextColumn Header="guid" Width="Auto" Binding="{Binding guid}" />
                    <DataGridTextColumn Header="activationDate" Width="Auto" Binding="{Binding activationDate}" />
                    <DataGridTextColumn Header="activeSyncID" Width="Auto" Binding="{Binding activeSyncID}" />
                    <DataGridTextColumn Header="batteryLevel" Width="Auto" Binding="{Binding batteryLevel}" />
                    <DataGridTextColumn Header="Compromised" Width="Auto" Binding="{Binding Compromised}" />
                    <DataGridTextColumn Header="hardwareModel" Width="Auto" Binding="{Binding hardwareModel}" />
                    <DataGridTextColumn Header="hardwareName" Width="Auto" Binding="{Binding hardwareName}" />
                    <DataGridTextColumn Header="homeCarrier" Width="Auto" Binding="{Binding homeCarrier}" />
                    <DataGridTextColumn Header="networkRoaming" Width="Auto" Binding="{Binding networkRoaming}" />
                    <DataGridTextColumn Header="internalStorageFree" Width="Auto" Binding="{Binding internalStorageFree}" />
                    <DataGridTextColumn Header="internalStorageSize" Width="Auto" Binding="{Binding internalStorageSize}" />
                    <DataGridTextColumn Header="imei" Width="Auto" Binding="{Binding imei}" />
                    <DataGridTextColumn Header="meid" Width="Auto" Binding="{Binding meid}" />
                    <DataGridTextColumn Header="osVersion" Width="Auto" Binding="{Binding osVersion}" />
                    <DataGridTextColumn Header="ownership" Width="Auto" Binding="{Binding ownership}" />
                    <DataGridTextColumn Header="phoneNumber" Width="Auto" Binding="{Binding phoneNumber}" />
                    <DataGridTextColumn Header="serialNumber" Width="Auto" Binding="{Binding serialNumber}" />
                    <DataGridTextColumn Header="udid" Width="Auto" Binding="{Binding udid}" />
                    <DataGridTextColumn Header="wifiMacAddress" Width="Auto" Binding="{Binding wifiMacAddress}" />
                </DataGrid.Columns>
            </DataGrid>
        </Grid>
    </Grid>
</Window>
"@

$inputXML = $inputXML -replace 'mc:Ignorable="d"',''

Function ErrorHandelling {
    $InfoParams = @{
        Title = "Error"
        TitleFontSize = 20
        TitleBackground = 'Red'
        TitleTextForeground = 'Black'
        Content = $($ActionLogger.ActionLog[-1].Text).replace("ERROR: ", "")
    }

    New-WPFMessageBox @InfoParams
}

function WPFGetUser_btn_Click_Event {
$emailRegEx = @"
    ^[a-zA-Z0-9.-]+@[a-zA-Z-]+(?:\.[a-zA-Z-]+)*$
"@

    # if (![System.Net.Mail.MailAddress]$WPFuemEmailAddess.Text) {
    if (![regex]::Match($WPFuemEmailAddress.text, $emailRegEx, "IgnoreCase")) {
        $ActionLogger.LogError("Invalid Email Address Supplied")
        ErrorHandelling
    } else {
        try {
			if(!$global:AuthorizationString){Connect-uemManagementConsole east}
            $script:userInfo = Get-uemUser $WPFuemEmailAddress.Text
			$script:groupInfo = Get-uemUserGroups $userInfo.guid
			$script:deviceInfo = Get-uemUserDevice $userInfo.guid

            $WPFuemDisplayName.Text = $userInfo.displayname
            $WPFuemName.Text = $userInfo.Name
            $WPFuemGuid.Text = $userInfo.guid
            $WPFuemCreated.Text = $userInfo.created
            $WPFuemDirectoryId.Text = $userInfo.directoryId

			foreach ($group in $groupInfo) {
				if (!($group.Name -eq "All users")) {
					$WPFuemGroup_DG.AddChild($Group)
				}
			}

			if ($WPFuemGroup_DG.count -le 1) {
				$WPFuemGroup_DG.GridLinesVisibility = "None"
			}
			# $WPFuemGroup_DG.ItemsSource = $groupInfo

			foreach ($device in $deviceInfo) {
				$WPFuemDevice_DG.AddChild($device)
			}

			# $WPFuemDevices.Text = $DeviceInfo

			$WPFSetActivation_btn.IsEnabled = $True
			$WPFclear_btn.IsEnabled = $True
        }
        catch {
            $ActionLogger.LogError($_)
            ErrorHandelling
        }
    }
}

function Clear_Form {
    $WPFuemCreated.Clear()
    $WPFuemDirectoryId.Clear()
    $WPFuemDisplayName.Clear()
    $WPFuemGuid.Clear()
    $WPFuemName.Clear()
    $WPFuemEmailAddress.Clear()

    # $WPFuemDevice_DG.Clear()
    $WPFuemGroup_DG.items.clear()
	$WPFuemDevice_DG.items.Clear()

	$userInfo = $null
	$groupInfo = $null
	$deviceInfo = $null

	$WPFSetActivation_btn.IsEnabled = $False
	$WPFclear_btn.IsEnabled = $False
}

$ActionLogger = [ActionLogger]::New("C:\Users\stephen.beale\Documents","Testing")
$ActionLogger.StartLog()

[xml]$XAML = $inputXML
#Read XAML

try{
    $Form=[Windows.Markup.XamlReader]::Load([System.Xml.XmlNodeReader]::new($xaml))
}
catch{
    Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)"
    $ActionLogger.LogError("Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)")
    ErrorHandelling
    throw
}

#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================

# $xaml.SelectNodes("//*[@Name]") | %{"trying item $($_.Name)";
$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    try {
        Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop
    }
    catch{
        throw
    }
}

Function Get-FormVariables{
    if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
    write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
    get-variable WPF*
}

Get-FormVariables

#===========================================================================
# Use this space to add code to the various form elements in your GUI
#===========================================================================
$WPFuemEmailAddress.IsReadOnly = $false
$WPFuemEmailAddress.Focus()
$WPFGetUser_btn.IsEnabled = $True

#Reference

#Adding items to a dropdown/combo box
    #$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})

#Setting the text of a text box to the current PC name
    #$WPFtextBox.Text = $env:COMPUTERNAME

#Adding code to a button, so that when clicked, it pings a system
# $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
# })

$WPFGetUser_btn.Add_Click({WPFGetUser_btn_Click_Event})

$WPFSetActivation_btn.Add_Click({
    try {
        Set-uemActivationPassword $WPFuemEmailAddress.text
        $InfoParams = @{
            Title = "INFORMATION"
            TitleFontSize = 20
            TitleBackground = 'LightSkyBlue'
            TitleTextForeground = 'Black'
            Content = 'Activation E-Mail Sent'
        }

        New-WPFMessageBox @InfoParams
    }
    catch {
        $ActionLogger.LogError($_)
        ErrorHandelling
    }
})

$WPFclear_btn.Add_Click({Clear_Form})

$WPFuemEmailAddress.add_KeyDown{
	param
	(
		[Parameter(Mandatory)][Object]$Sender,
		[Parameter(Mandatory)][Windows.Input.KeyEventArgs]$e
	)

	if($e.Key -eq 'Enter') {
		WPFGetUser_btn_Click_Event
	}

}
$form.add_KeyDown{
	param
	(
		[Parameter(Mandatory)][Object]$Sender,
		[Parameter(Mandatory)][Windows.Input.KeyEventArgs]$e
	)

	if ($e.Key -eq 'Escape') {
		Clear_Form
	}
}
#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
$Form.ShowDialog() | out-null

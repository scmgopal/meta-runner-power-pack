$sut = $PSItem.Name -replace ".Tests.", "."
. "$(Join-Path $PSScriptRoot $sut)"

$build_counter = "45"

function Fixture {
	param(
		[String]$Fixture,
		[ScriptBlock]$Action
	)
	
	Describe $('=== {0} ===' -f $Fixture) {
		& $Action
	}
}

function Given {
	param(
		[String]$Given,
		[ScriptBlock]$Action,
		[String]$WorkingDirectory = $TestDrive
	)

	Context $("given {0}" -f $Given) {
		In $WorkingDirectory {						
			& $Action			
		}
	}
}

function Then {
	param(
		[String]$Then,
		[ScriptBlock]$Action
	)
	
	It $('then {0}' -f $Then) {
		& $Action
	}
}

function Background {}



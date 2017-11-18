package  {
	
	public class AppState {
	
		private var number: int;
		private var lastStates: Array;
		private var nextStates: Array;
		private var isActive: Boolean;
		
		public function AppState(num: int) {
			this.number = num;
			this.lastStates = new Array();
			this.nextStates = new Array();
			this.isActive = false;
		}
		
		public function AddLastState(state: AppState): void {
			this.lastStates.push(state);
		}
		
		public function AddNextState(state: AppState): void {
			this.nextStates.push(state);
		}
		
		public function GetNumber():int {
			return this.number;
		}
		
		public function Activate(): Boolean {
			for (var i: String in this.lastStates) {
				if (!this.lastStates[i].IsActive())
					return false;
			}
			this.isActive = true;
			return true;
		}
		
		public function Deactivate(): Boolean {
			this.isActive = false;
			return true;
		}
		
		public function IsActive(): Boolean {
			return this.isActive;
		}
	}	
}

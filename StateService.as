package  {
	
	public class StateService {
		private var states: Array;
		
		public static const Init: int = 0;
		public static const File1_Staged: int = 1;
		public static const File2_Staged: int = 2;		
		public static const Commit_text_written: int = 4;
		public static const Commited: int = 5;
		
		public function StateService() {
			this.AddStates();			
			
			this.ConnectStates(StateService.Init, StateService.File1_Staged);
			this.ConnectStates(StateService.Init, StateService.File2_Staged);
			this.ConnectStates(StateService.Init, StateService.Commit_text_written);			
			
			this.ConnectStates(StateService.File1_Staged, StateService.Commited);
			this.ConnectStates(StateService.File2_Staged, StateService.Commited);
			this.ConnectStates(StateService.Commit_text_written, StateService.Commited);
		}
		
		private function AddStates() {
			this.states = new Array();
			this.states.push(new AppState(Init));			
			this.states.push(new AppState(File1_Staged));	
			this.states.push(new AppState(File2_Staged));	
			this.states.push(new AppState(Commit_text_written));
			this.states.push(new AppState(Commited));
		}
		
		private function GetState(num: int): AppState {
			for (var i: String in this.states) {
				if (this.states[i].GetNumber() == num) {
					return this.states[i];
				}
			}
			throw new Error("There are no states with this number!");
		}
		
		private function ConnectStates(first: int, next: int): void {
			var firstState: AppState = this.GetState(first);
			var nextState: AppState = this.GetState(next);
			firstState.AddNextState(nextState);		
			nextState.AddLastState(firstState);
		}
		
		public function ActivateState(num: int): Boolean {
			var state: AppState = this.GetState(num);
			return state.Activate();
		}
		
		public function DeactivateState(num: int): Boolean {
			var state: AppState = this.GetState(num);
			return state.Deactivate();
		}
		
		public function IsActive(num: int): Boolean {
			var state: AppState = this.GetState(num);
			return state.IsActive();
		}
	}
	
}

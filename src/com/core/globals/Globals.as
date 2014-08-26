package com.core.globals
{
	import com.core.MainApplaction;

	import starling.display.Stage;


	public class Globals
	{
		private static var _stage:Stage;

		/**
		 *资源初始化完毕
		 */
		public static var GAME_RESOURCE_LOADED:String="GAME_RESOURCE_LOADED";


		public static function get stage():Stage
		{
			if (_stage == null)
				_stage=MainApplaction.mStarling.stage;
			return _stage;
		}
	}
}

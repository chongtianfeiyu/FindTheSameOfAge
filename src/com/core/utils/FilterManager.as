package com.core.utils
{
	import starling.filters.BlurFilter;

	public class FilterManager
	{
		public function FilterManager()
		{
		}

		public static function get greenGlowFilter():BlurFilter
		{
			return BlurFilter.createGlow(0x00ff00, 1, 5);
		}
	}
}

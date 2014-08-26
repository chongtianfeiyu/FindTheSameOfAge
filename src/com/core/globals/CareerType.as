package com.core.globals
{

	public class CareerType
	{
		public static const TYPE_FIGHTER:String="fighter";
		public static const TYPE_MAGICIAN:String="magician";
		public static const TYPE_CURACY:String="curacy";
		public static const TYPE_ARCHER:String="archer";

		public static function getName(type:String):String
		{
			switch (type)
			{
				case TYPE_FIGHTER:
					return "战士";
				case TYPE_MAGICIAN:
					return "法师";
				case TYPE_CURACY:
					return "辅助";
				case TYPE_ARCHER:
					return "弓手";
				default:
					return "";
			}
		}

	}
}

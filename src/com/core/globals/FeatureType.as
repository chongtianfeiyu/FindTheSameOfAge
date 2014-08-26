package com.core.globals
{

	public class FeatureType
	{
		public static const FEATURE_CLOSE_DPS:String="近战物理系";
		public static const FEATURE_LONG_DPS_GIFTS:String="远程物理系";
		public static const FEATURE_MAGIC_DPS_GIFTS:String="远程魔法系";
		public static const FEATURE_ASSIST_GIFTS:String="团队辅助系";

		public static function getMainGifts(type:String):uint
		{
			switch (type)
			{
				case FEATURE_CLOSE_DPS:
					return GiftType.FIGHT;
				case FEATURE_LONG_DPS_GIFTS:
					return GiftType.WILD;
				case FEATURE_MAGIC_DPS_GIFTS:
					return GiftType.MAGIC;
				case FEATURE_ASSIST_GIFTS:
					return GiftType.LOVE;
				default:
					return 0x0;
			}
		}

		public static function getAddtionGifts(type:String):Array
		{
			switch (type)
			{
				case FEATURE_CLOSE_DPS:
					return [GiftType.SHIELD, GiftType.WILL, GiftType.ASSASSINATION];
				case FEATURE_LONG_DPS_GIFTS:
					return [GiftType.ASSASSINATION, GiftType.WILL, GiftType.BARDIC];
				case FEATURE_MAGIC_DPS_GIFTS:
					return [GiftType.DEATH, GiftType.SORCERY, GiftType.ASSASSINATION, GiftType.WILL];
				case FEATURE_ASSIST_GIFTS:
					return [GiftType.BARDIC, GiftType.WILL, GiftType.SHIELD];
				default:
					return [];
			}
		}
	}
}

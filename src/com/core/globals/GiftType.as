package com.core.globals
{

	public class GiftType
	{
		public static const ALL_GIFT:Array=[0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0xa];
		public static const NONE:uint=0x0;
		/**
		 *死亡
		 */
		public static const DEATH:uint=0xa;
		/**
		 *格斗
		 */
		public static const FIGHT:uint=0x1;
		/**
		 *生命
		 */
		public static const LOVE:uint=0x2;
		/**
		 *元素
		 */
		public static const MAGIC:uint=0x4;
		/**
		 *幻术
		 */
		public static const SORCERY:uint=0x8;
		/**
		 *野性
		 */
		public static const WILD:uint=0x10;
		/**
		 *意志
		 */
		public static const WILL:uint=0x20;
		/**
		 *吟游
		 */
		public static const BARDIC:uint=0x40;
		/**
		 *暗杀
		 */
		public static const ASSASSINATION:uint=0x80;
		/**
		 *铁壁
		 */
		public static const SHIELD:uint=0x100;

		public static function getGiftName(type:uint):String
		{
			switch (type)
			{
				case LOVE:
					return "生命";
				case WILD:
					return "野性";
				case ASSASSINATION:
					return "暗杀";
				case FIGHT:
					return "格斗";
				case SHIELD:
					return "铁壁";
				case MAGIC:
					return "元素";
				case BARDIC:
					return "吟游";
				case WILL:
					return "意志";
				case SORCERY:
					return "幻术";
				case DEATH:
					return "死亡";
				default:
					return "";
			}
		}

		public static function getGiftTypeByName(name:String):uint
		{
			switch (name)
			{
				case "生命":
					return LOVE;
				case "野性":
					return WILD;
				case "暗杀":
					return ASSASSINATION;
				case "格斗":
					return FIGHT;
				case "铁壁":
					return SHIELD;
				case "元素":
					return MAGIC;
				case "吟游":
					return BARDIC;
				case "意志":
					return WILL;
				case "幻术":
					return SORCERY;
				case "死亡":
					return DEATH;
				default:
					return NONE;
			}
		}

		public static function getGiftTexture(type:uint):String
		{
			switch (type)
			{
				case LOVE:
					return "icon_skill_love26";
				case WILD:
					return "icon_skill_wild02";
				case ASSASSINATION:
					return "icon_skill_vocation05";
				case FIGHT:
					return "icon_skill_fight10";
				case SHIELD:
					return "icon_skill_streak16";
				case MAGIC:
					return "icon_skill_magic01";
				case BARDIC:
					return "icon_skill_romance02";
				case WILL:
					return "icon_skill_will14";
				case SORCERY:
					return "icon_skill_illusion04";
				case DEATH:
					return "icon_skill_death06";
				default:
					return "";
			}
		}
	}
}

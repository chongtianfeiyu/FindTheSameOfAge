package com.core.vo
{
	import com.core.globals.GiftType;

	public class SkillVO
	{
		public var id:int;
		public var name:String;
		public var giftVO:GiftVO;
		public var icon:String;
		public var isPassiveSkill:Boolean;

		public function SkillVO(xml:XML)
		{
			id=xml.@id;
			name=xml.@name;
			giftVO=new GiftVO(GiftType.getGiftTypeByName(xml.@gift));
			icon=xml.@icon;
			isPassiveSkill=xml.@isPassiveSkill == "true";
		}

		public function get textureName():String
		{
			return icon.split(".")[0];
		}
	}
}

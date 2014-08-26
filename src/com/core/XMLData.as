package com.core
{
	import com.core.vo.SkillVO;

	public class XMLData
	{
		[Embed(source="../../assets/data/skill_cn.xml", mimeType="application/octet-stream")]
		private static var _skillData:Class;

		private static var _skillList:Vector.<SkillVO>;

		public static function get skillData():Vector.<SkillVO>
		{
			if (_skillList == null)
			{
				_skillList=new Vector.<SkillVO>();

				var skillXml:XML=XML(new _skillData());
				for each (var xml:XML in skillXml.children())
				{
					_skillList.push(new SkillVO(xml));
				}
			}
			return _skillList;
		}

		public static function getSkillByName(skillName:String):SkillVO
		{
			for each (var vo:SkillVO in skillData)
			{
				if (vo.name == skillName)
					return vo;
			}
			return null;
		}

		public static function getActiveSkillByGiftType(type:uint):Vector.<SkillVO>
		{
			var ret:Vector.<SkillVO>=new Vector.<SkillVO>();
			for each (var vo:SkillVO in skillData)
			{
				if (vo.giftVO.giftType == type && !vo.isPassiveSkill)
					ret.push(vo);
			}
			return ret;
		}
	}
}

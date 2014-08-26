package com.core.module.main.model
{
	import com.core.XMLData;
	import com.core.globals.GiftType;
	import com.core.vo.SkillVO;

	public class RandomSkillList
	{

		public static function getRandomSkillList(total:int):Vector.<SkillVO>
		{
			var src:Vector.<SkillVO>=XMLData.getActiveSkillByGiftType(GiftType.BARDIC);
			src=src.concat(XMLData.getActiveSkillByGiftType(GiftType.FIGHT));
			src=src.concat(XMLData.getActiveSkillByGiftType(GiftType.WILD));

			var randomListx1:Vector.<SkillVO>=new Vector.<SkillVO>();
			while (randomListx1.length < total / 2)
			{
				var index:int=Math.random() * src.length;
				randomListx1.push(src[index]);
			}

			var randomListx2:Vector.<SkillVO>=new Vector.<SkillVO>();
			randomListx2=randomListx1.concat(randomListx1);
			randomListx2.sort(randomSort);
			return randomListx2;
		}

		public static function randomSort(elementA:Object, elementB:Object):Number
		{
			return Math.random() - .5
		}

	}
}

package com.core.vo
{
	import com.core.globals.GiftType;

	public class GiftVO
	{
		public var giftName:String;
		public var giftType:uint;

		public function GiftVO(giftType:uint)
		{
			this.giftType=giftType;
			this.giftName=GiftType.getGiftName(giftType);
		}
	}
}

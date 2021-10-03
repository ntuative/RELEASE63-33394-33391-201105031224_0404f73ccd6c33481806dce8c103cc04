package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_582:QuestsList;
      
      private var var_484:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_337:QuestTracker;
      
      private var var_882:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_337 = new QuestTracker(this._questEngine);
         this.var_582 = new QuestsList(this._questEngine);
         this.var_484 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_882 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_582.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_582.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_337.onQuest(param1);
         this.var_484.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_337.onQuestCompleted(param1);
         this.var_484.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_337.onQuestCancelled();
         this.var_484.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_337.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_582.onRoomExit();
         this.var_337.onRoomExit();
         this.var_484.onRoomExit();
         this.var_882.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_337.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_582)
         {
            this.var_582.dispose();
            this.var_582 = null;
         }
         if(this.var_337)
         {
            this.var_337.dispose();
            this.var_337 = null;
         }
         if(this.var_484)
         {
            this.var_484.dispose();
            this.var_484 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_882)
         {
            this.var_882.dispose();
            this.var_882 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_582;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_484;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_337;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_882;
      }
   }
}

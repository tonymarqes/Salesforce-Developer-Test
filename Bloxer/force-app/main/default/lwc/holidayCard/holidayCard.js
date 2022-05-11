import { LightningElement, wire} from 'lwc';
import getNextHoliday from "@salesforce/apex/HolidayCardController.getNextHoliday"
export default class HolidayCard extends LightningElement {
    hasNextHoliday = false;
    Name = '';
    isToday = false;
    Date = '';
    DaysDiff = '';

    @wire(getNextHoliday) wiredHoliday({data, error}){
        if (data) {
            if(data.hasNextHoliday){
                this.hasNextHoliday = data.hasNextHoliday;
                this.Name = data.Name;
                this.isToday = data.isToday;
                this.Date = data.Date;
                this.DaysDiff = data.DaysDiff;
            }
            } else if (error) {
            console.log(error);
            }
    }
}
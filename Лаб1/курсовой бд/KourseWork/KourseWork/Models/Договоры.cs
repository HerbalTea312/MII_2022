//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KourseWork.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Договоры
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Договоры()
        {
            this.Выполнение_услуги = new HashSet<Выполнение_услуги>();
        }
    
        public string Номер_договора { get; set; }
        public decimal Стоимость { get; set; }
        public System.DateTime Дата_заключения { get; set; }
        public int Кол_во_услуг { get; set; }
        public string Паспорт_заказчика { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Выполнение_услуги> Выполнение_услуги { get; set; }
        public virtual Исполнитель Исполнитель { get; set; }
    }
}

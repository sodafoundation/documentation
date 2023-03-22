import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { ContactComponent } from './components/contact/contact.component';
import { GettingStartedComponent } from './components/getting-started/getting-started.component';
import { HomeComponent } from './components/home/home.component';


const routes: Routes = [
  {
    path: '', component: AdminDashboardComponent, children: [
      { path: 'home', component: HomeComponent },
      { path: 'contact', component: ContactComponent },
      { path: 'getting-started', component: GettingStartedComponent },
      { path: '', redirectTo: 'admin/home', pathMatch: 'full' },


    ]
  }  // the routes which we will be using in admin module is kept in the children array.
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { ForgetPasswordComponent } from './components/forget-password/forget-password.component';
import { NotFoundComponent } from './components/not-found/not-found.component';


const routes: Routes = [
{path: 'login', component: LoginComponent },
{path: 'forget-password', component: ForgetPasswordComponent },
{path: '' , redirectTo : '/login', pathMatch: 'full'},
// LAZY LOADING 

{path:'admin',
loadChildren: ()=> 
import('./modules/admin/admin.module').then((m) => m.AdminModule),
},
{path: '**', component: NotFoundComponent }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }


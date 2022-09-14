#include <TStyle.h>
#include <TCanvas.h>
#include <TChain.h>
#include <TFile.h>
#include <time.h>
#include <stdlib.h>

#include <vector>
#include <iostream>


void neutrino2()
{
TFile* f = new TFile("QGSP_BERT_HP_new.root");
        TTree* tree = (TTree *) f -> Get("flux");

vector<double>* pid  = new vector<double>;
vector<double>* trackE  = new vector<double>;
double flPid = 0;
double fltrackE = 0;
 cout << pid << " " << trackE << endl;


        tree -> SetBranchAddress("pid",&pid);
        tree -> SetBranchAddress("trackE",&trackE);

       pid-> clear();
       trackE-> clear();

  TH1F *v_mu1  = new TH1F("#nu_{#mu}", "", 363, 30., 10000.);
      TH1F *v_mu2  = new TH1F("#bar{#nu}_{#mu}", "", 363, 30, 10000.);
      TH1F *v_e1  = new TH1F("#nu_{e}", "", 363, 1., 10000.);
      TH1F *v_e2  = new TH1F("#bar{#nu}_{e}", "", 363, 1., 10000.);

                   Int_t nentries = (Int_t)tree -> GetEntries();
                   cout << "n : "    <<  nentries  <<  endl;
   for(int i=0;i<nentries;i++){
                       tree -> GetEntry(i);
                               Int_t nn=pid->size();


                                for(int ii=0; ii<nn; ii++) {

                                     fltrackE=(*trackE)[ii];
                                        flPid=(*pid)[ii];
                                    if(flPid==12)           {    v_e1 -> Fill(fltrackE);           }
                                    if(flPid==-12)          {    v_e2 -> Fill(fltrackE);           }
                                    if(flPid==14)           {    v_mu1 -> Fill(fltrackE);          }
                                    if(flPid==-14)          {    v_mu2 -> Fill(fltrackE);           }
}
}

TGraph *MyGraph = new TGraph("fluka2.txt");


     TCanvas *c1  =  new TCanvas("c1","neutrino energy");

               c1-> SetLogx();
               c1-> SetLogy();
               c1-> SetLineWidth(5);
            v_mu1-> GetXaxis()->SetTitle("Energy(MeV)");
            v_mu1-> SetLineColor(2);
            v_mu1-> Draw("hist");
           v_mu2 -> SetLineColor(4);
           v_mu2 -> Draw("histsame");
            v_e1 -> SetLineColor(6);
            v_e1 -> Draw("histsame");
            v_e2 -> SetLineColor(8);
            v_e2 -> Draw("histsame");

MyGraph->Draw("same");

               c1->BuildLegend();
 }


